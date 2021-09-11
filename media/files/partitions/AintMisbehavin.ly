
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

title = #"Ain't Misbehavin'"
composer = #"Fats Waller"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"


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
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


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

harmonies = \chordmode {
  \set chordChanges = ##f
  des2:5-7 c:5+7 f:7 bes4.:6 es8:6 s2 des4:7 d8:dim7 es:6 bes1:7
  es2:6 e:dim f:m7 fis:dim g:m7 bes:m7 as:6 des:7
  es:6 ges:7 f:m7 bes:7 
  g:7 c:7 f:7 bes:9- 
  es:6 as:9 d:9- g:5+7
  c1:m as:7/c f:7/c c:7 bes2:6/f des:7 c:m7 f:7 bes:7 c:7 f:7 bes:9-
  es2:6 e:dim f:m7 fis:dim g:m7 bes:m7 as:6 des:7
  es:6 ges:7 f:m7 bes:7 
  es2:6 \startParenthesis \parenthesize c:m7 f:m7 \endParenthesis \parenthesize  bes:9-
 
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \Intro
  \override Staff.TextSpanner.extra-offset = #'(0 . 3)
  \override TextSpanner.bound-details.left.text = "piano"
  \textSpannerDown
  r8 g--  \startTextSpan g4-. as8-- as-> r as-- | f4-. f8-- g->~ g4 g8-- es->~ | 
  es2 es4-- es8-- es-> | r a, bes bes~ bes2 \stopTextSpan \bar "||" \break
  \repeat volta 2 {
    \A r8 es f es bes' bes4. |  f8 g f c'~ 2 | 
    r8 bes c bes es es4 d8 | f es c g~ g ges f4 | \break
    r8 es f es bes' bes4. | f8 g f c'~ c c4 bes8
  }
  \alternative {
    { g1~ | g2 r  }
    { es1~ | es2 r \bar "||" \break }
  }
  \B r4 es'8 c es c4. | r4 es8 c es c4. | r4 es8 c es c4. | r4 e8 c e c4. |  
  r4 f f f | f es d c | bes2 c | g f | \break
  \A r8 es f es bes' bes4. | f8 g f c'~ 2  | r8 bes c bes es es4 d8 | f es c g~ g ges f4 | \break 
  r8 es f es bes' bes4. | 8 g f c'~ c c4 bes8 
  es1 | R |
  \bar ".."
}

grille = \chordmode {
  \bar "[|:" \/es2:6 e:dim \/f:m7 fis:dim \/g:m7 bes:m7 \/as:6 des:7 \break
  \/es:6 ges:7 \/f:m7 bes:7 \set Score.repeatCommands = #'((volta "1"))
  \/g:7 c:7 \s f:7 bes:9- \set Score.repeatCommands = #'((volta #f)end-repeat) \break
  \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
  \/es2:6 as:9 \/d:9- g:5+7 \set Score.repeatCommands = #'((volta #f)) \break \bar "||"
  \startStaff c1:m as:7/c f:7/c c:7 \break
  \/bes2:6/f des:7 \/c:m7 f:7 \/bes:7 c:7 \/f:7 bes:9- \break
  \/es2:6 e:dim \/f:m7 fis:dim \/g:m7 bes:m7 \/as:6 des:7 \break
  \/es2:6 ges:7 \/f:m7 bes:7 \Coda \/es:6 c:m7 \/f:m7 bes:9- \break \bar "|."
  \Coda 
  \/es2:6.9 d:9- \startStaff  es1:6.9 \bar ".." \stopStaff s \bar "" s \bar ""
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A 
}


verse = \lyricmode {
  \repeat unfold 16 {  \skip 1 }
  No one to talk with,
  All by my -- self,
  No one to walk with
  But I'm hap -- py
  On the shelf,
  Ain't mis -- be -- ha -- vin',
  I'm sa -- vin' my love for You. You.

  Like Jack Hor -- ner
  In the cor -- ner,
  Don't go no -- where,
  What do I care?
  Your kis -- ses
  Are worth wai -- tin' for,
  Be -- lieve me

  I don't stay out late,
  Don't care to go,
  I'm home a -- bout eight,,
  Just me and my ra -- di -- o,
  Ain't mis -- be -- ha -- vin',
  I'm sa -- vin' my love for You.
}

verseB = \lyricmode {
  \repeat unfold 16 {  \skip 1 }
  I know for cer -- tain,
  The one I love,
  I'm through with flir -- tin',
  It's you that I'm thin -- kin' of,
  Ain't mis -- be -- ha -- vin',
  I'm sa -- vin' my love for
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose es f \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose es f \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose es c' \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose es c' \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics { \verse }
          \addlyrics { \verseB }
        >>  
      >>
      %   }   
      %   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose es f \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose es f \theNotes
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \transpose es f \grille
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose es c' \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice  \transpose es c' \theNotes
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \transpose es c' \grille
      >>
} } }