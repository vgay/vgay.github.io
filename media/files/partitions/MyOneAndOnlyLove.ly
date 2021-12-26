\version "2.22.1"
#(set-global-staff-size 17)
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

title = #"My One And Only Love"
composer = #"Guy Wood"
meter = #"(Mod. Ballad)"
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
  c2:7+ a:m7 d:m7 g4:7 gis:dim7 
  a2:m7 f:7+ d4:m g:7 e:m a:7 d2:m7 b4:m5-7 e:9+ a2:m7 d:7
  d:m7 g:7 e4:m a:7 d:m g:7
  d2:m7 g:7 c:7+ fis4:m5-7 b:9-
  e1:m7 fis2:m5-7 b:9- e1:m fis2:m5-7 b:9-
  e:m e:m7+ e:m7 a:7 d2:m a:7 d:m7 g:7 
 c2:7+ a:m7 d:m7 g4:7 gis:dim7 
  a2:m7 f:7+ d4:m g:7 e:m a:7 d2:m7 b4:m5-7 e:9+ a2:m7 d:7
  d:m7 g:9- c:6 \parenthesize g:7
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \showStartRepeatBar \bar "[|:" \A
  \repeat volta 2 {
    r8 g a8. b16 d8 e b' g | \noBreak a4 d b ~ \times 2/3 { b8 g f } | \noBreak 
    e4 c' a ~ \times 2/3 {  a8 f e } | \noBreak  d4 b' g2 | \break
    r8 a g f e8. d16 g8. e16 | c8 a4. ~ a2
  }
  \alternative {
    { r8 f' g a g4 d | g1 }
    {r8 f g a g4 e | c2. r8 b  \bar "||" \break }
  }
  \B
  b'4 ~ \times 2/3 { b8 a c } b4 ~ \times 2/3 { b8 a c } | b, b4. ~ b4 r8 b8 |
  b'4 ~ \times 2/3 { b8 a c } b4 ~ \times 2/3 { b8 a c } | b,2. r8 b |  \break
  e4 ~ \times 2/3 { e8 fis g } e4. b8 |  e4 ~ \times 2/3 { e8 fis g } e2 |
  \times 2/3 { d4 d d } \times 2/3 { f d f } | d1 \break \A \bar "||"
  r8 g, a8. b16 d8 e b' g | a4 d b ~ \times 2/3 { b8 g f } |
  e4 c' a ~ \times 2/3 {  a8 f e } | d4 b' g2 | \break
  r8 a g f e8. d16 g8. e16 | c8 a4. ~ a2
  r8 f g f as4 b |  c1 \bar ".."
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
  \bar "[|:"
 \/c2:7+ a:m7 \w d:m7 g4:7 gis:dim7 
  \/a2:m7 f:7+ 
  \x d4:m g:7 e:m a:7  \break
  \w d2:m7 b4:m5-7 e:9+ \/a2:m7 d:7
  \/d:m7 g:7 \set Score.repeatCommands = #'((volta "1")) 
  \xa e4:m a:7 d:m g:7 \break
  \set Score.repeatCommands = #'((volta #f) end-repeat)
  \stopStaff s1 \bar "" s \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2")) 
  \wb c2:7+ fis4:m5-7 b:9- \bar "||" \break
  \set Score.repeatCommands = #'((volta #f)) 
  e1:m7 \/fis2:m5-7 b:9- e1:m \/fis2:m5-7 b:9- \break
  \/e:m e:m7+ \/e:m7 a:7 \/d2:m a:7 \/d:m7 g:7  \bar "||"  \break
   \/c2:7+ a:m7 \w d:m7 g4:7 gis:dim7 
  \/a2:m7 f:7+ 
  \x d4:m g:7 e:m a:7  \break
  \w d2:m7 b4:m5-7 e:9+ \/a2:m7 d:7
  \/d:m7 g:7 \/c:6 g:7
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

VerseA = \lyricmode {
  The ve -- ry thought of you makes my heart sing
Like an A -- pril breeze on the wings of spring
And you ap -- pear in all your splen -- dor__
My one and on -- ly love
\repeat unfold 7 { \skip 1 }



touch of your hand is like hea -- ven
A hea -- ven that I've ne -- ver known
The blush on your cheek when -- e -- ver I speak
Tells me that you are my own

You fill my ea -- ger heart with such de -- sire
Eve -- ry kiss you give sets my soul on fire
I give my -- self in sweet sur -- ren -- der
My one and on -- ly love
}

VerseB = \lyricmode {
  The sha -- dows fall and spread their mys -- tic charms
In the hush of night while you're in my arms
I feel your lips so warm and ten -- der \repeat unfold 6 { \skip 1 }
My one and on -- ly love
The
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
          \transpose c a, \theNotes
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
          \addlyrics \VerseA
          \addlyrics \VerseB
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
          \addlyrics \VerseA
          \addlyrics \VerseB
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
          \transpose c a, \theNotes
           \addlyrics \VerseA
          \addlyrics \VerseB
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