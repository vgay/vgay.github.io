
\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Syracuse"
composer = #"Henri Salvador"
meter = #"(Ballad)"
kwtempo = #"Slow"
kwstyle = #"Ballad"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
s1 g1:m9 cis2:dim7 c:6 f:7+ c:9sus4 f:6 bes4:7+ g:m7/d 
g2:m9 d:m7 c2:7 g4:7 fis:9- f2:7+ g4:m5-7 c:9- f8:6 r s2.f2:7+ es:7+/bes
c2:m9 c:7sus4 c:m9 d:m7 bes:7+ es:m/bes bes:7+ des:7+/as 
bes:m9 c:7/e g1:m9 a:9- f8:7+ r s2.
g1:m9 cis2:dim7 c:6 f:7+ c:9sus4 f:6 bes4:7+ g:m7/d 
g2:m9 d:m7 c2:7 g4:7 fis:9-  f2:7+ c:9- f1:6
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  r8 c d e e4 \tuplet 3/2 { d8 a g } |
  \repeat volta 2 { \A
    a4. 8~ 2 | r8 g a c c a4 e16 d | e1 | r8 d d a' a4 \tuplet 3/2 { g8 g d } \break
    a'4. 8~ 2 | r8 d, d a' a g g d | a'1 }
  \alternative { 
    { r8 c d e e4 \tuplet 3/2 { d8 a g } } { r8 c c d d c c g }
  } \break \bar "||" \B
  d'4. c8~ 2 | r8 c c d d c c g | d'1 | r8 bes bes c c bes bes f | \break
  c'4. bes8~ 2 | r8 f g a a2 | r8 f g a a2 | r8  c d e e4 \tuplet 3/2 { d8 a g } \break \bar "||"
  \A a4. 8~ 2 | r8 g a c c a4 e16 d | e1 | r8 d d a' a4 \tuplet 3/2 { g8 g d } \break
  a'4. 8~ 2 | r8 d, d a' a g g d | a'1~| a \bar ".."
  }


chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:" g1:m9 \/cis2:dim7 c:6 \/f:7+ c:9sus4 \w f:6 bes4:7+ g:m7/d \break
  \/g2:m9 d:m7 \w c2:7 g4:7 fis:9- \w f2:7+ g4:m5-7 c:9- 
  \set Score.repeatCommands = #'((volta "1")) f1:6 
  \set Score.repeatCommands = #'((volta #f)'end-repeat) \break
  \stopStaff s1 \bar "" s1 \bar "" s1 \startStaff 
    \set Score.repeatCommands = #'((volta "2")) \/f2:7+ es:7+/bes \bar "||"
  \set Score.repeatCommands = #'((volta #f)) \break
  \/c2:m9 c:7sus4 \/c:m9 d:m7 \/bes:7+ es:m7+/bes \/bes:7+ des:7+/as \break
  \/bes:m9 c:7/e g1:m9 a:9- f:7+ \break \bar "||"
  g1:m9 \/cis2:dim7 c:6 \/f:7+ c:9sus4 \w f:6 bes4:7+ g:m7/d \break
   \/g2:m9 d:m7 \w c2:7 g4:7 fis:9- \/f2:7+ c:9- f1:6 \bar ".."

 
  \bar ".." }

marques = \relative c' { 
   s1 ^\markup \bold \box \fontsize #7 A s1*11 
   s1 ^\markup \bold \box \fontsize #7 B s1*7 
   s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
J’ai -- me -- rais tant voir Sy -- ra -- cu -- se
L’î -- le de Pâ -- ques__et Kai -- rou -- an
Et les grands ois -- eaux qui s’a -- mu -- sent
A glis -- ser l’ai -- le sous le vent

Voir les jar -- dins de Ba -- by

Voir le pa -- ys du ma -- tin cal -- me
Al -- ler pê -- cher au cor -- mo -- ran
Et m’e -- ni -- vrer de vin de pal -- me
En é -- cou -- tant chan -- ter le vent

A -- vant que ma jeu -- nes -- se s’u -- se
Et que mes prin -- temps soient par -- tis
J’ai -- me -- rais tant voir Sy -- ra -- cu -- se
Pour m’en sou -- ve -- nir à Pa -- ris 
}

verseB = \lyricmode {
  \repeat unfold 7 { \skip 1 }
lo -- ne
Et le pa -- lais du grand La -- ma
Rê -- ver des a -- mants de Vé -- ro -- ne
Au som -- met du Fu -- ji Ya -- ma
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        \addlyrics \verse
        \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        \addlyrics \verse
        \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        \addlyrics \verse
        \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

