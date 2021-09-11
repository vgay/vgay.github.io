
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Cry Me A River"
composer = #"Arthur Hamilton"
meter = #"(Ballad)"
kwtempo = #"Mod. Slow"
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


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  c2:m c:m5+ c:m6 c:m7 f:m7 bes:7 es:7+ d4:m5-7 g:7 g2:m5-7 c:9- c:m7 f:9
  f:m7 bes:7sus4 es:7+  g:7 es:7+ d:9+
  g:m7 e:m5-7 a:m5-7 d:9- g:m7 e:m5-7 a:m5-7 d:9- g:m7 e:m5-7 a:m5-7 d:9- g1:7+ d2:m7 g:7
  c2:m c:m5+ c:m6 c:m7 f:m7 bes:7 es:7+ d4:m5-7 g:7 g2:m5-7 c:9- c:m7 f:9
  f:m bes:7sus4 es:7+
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A d2~ d8 c g es | d c~ c2. | r8 c es c' bes4 c | g2~ g8 g fis g \break |
    c4 ~ \times 2/3 { c8 des c } des c4. | r8 g~ \times 2/3 { g f es } f g4. |
    r8 ges f  es f es c es
  }
  \alternative {
    { es1 }
    { es }
  }
  \bar "||" \break
  \B r8 g a bes d, e fis g | a g bes a~ a4. g8 | bes c d c~ c4 bes8 c~ | c1 | 
  r8 g a bes d, e fis g | a g bes a~ a2 | r8 a16 g a8 g a g b g | r a16 g a8 g a g b g |
  \bar "||" \break
  \A d'2~ d8 c g es | d c~ c2. | r8 c es c' bes4 c | g2~ g8 g fis g \break
  c4 ~ \times 2/3 { c8 des c } des c4. | r8 g~ \times 2/3 { g f es } f g4. |
  r8 ges f es f es c es | es1
  \bar ".."
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
  \/c2:m c:m5+ \/c:m6 c:m7 \/f:m7 bes:7 \w es:7+ d4:m5-7 g:7 \break
  \/ g2:m5-7 c:9- \/c:m7 f:9 \/f:m7 bes:7sus4 
  \set Score.repeatCommands = #'((volta "1")) \s es:7+ g:7 
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s1 \bar "" s1 \startStaff 
  \set Score.repeatCommands = #'((volta "2"))
  \/es2:7+ d:9+
  \set Score.repeatCommands = #'((volta #f)) \break
  \/g:m7 e:m5-7 \/a:m5-7 d:9- \/g:m7 e:m5-7 \/a:m5-7 d:9-  \break
  \/g:m7 e:m5-7 \/a:m5-7 d:9- g1:7+ \/d2:m7 g:7 \break
  \/c2:m c:m5+ \/c:m6 c:m7 \/f:m7 bes:7 \w es:7+ d4:m5-7 g:7 \break
  \/ g2:m5-7 c:9- \/c:m7 f:9 \/f:m7 bes:7sus4 es1:7+
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  Now you say you're lone -- ly
  You cried the long night through
  Well, you can cry me a ri -- ver,
  Cry me a ri -- ver
  I cried a ri -- ver o -- ver you \skip 1



  You drove me, near -- ly drove me, out of my head
  While you ne -- ver shed a tear
  Re -- mem -- ber, I re -- mem -- ber, all that you said
  Told me love was too ple -- be -- ian
  Told me you were through with me and

  Now you say you love me
  Well, just to prove you do
  Come on and cry me a ri -- ver,
  Cry me a river
  I cried a river o -- ver you

  % You drove me, nearly drove me, out of my head
  % While you never shed a tear
  % Remember, remember, all that you said
  % Told me love was too plebeian
  % Told me you were through with me and
  % Now, now you say you love me
  % Well, just to prove you do
  % Come on and cry, cry, cry me a river,
  % Cry me a river
  % 'Cause I cried a river over you
  % 
  % If my pillow talk, imagine what it would have said
  % Could it be a river of tears I cried in bed?
  % So you can cry me a river
  % Daddy, go ahead and cry that river
  % Cause I cried, how I cried a river over you
  % How I cried a river over you
}

verseB = \lyricmode {
  Now you say you're sor -- ry
  For be -- ing so un -- true
  Well, you can cry me a ri -- ver,
  Cry me a ri __ ver
  I cried a ri -- ver o -- ver \skip 1 you
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
    } }  \bookpart {
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
    } }  \bookpart {
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
    } }  \bookpart {
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